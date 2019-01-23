using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Reflection;
using DatabaseWebService.DatabaseObjects;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace DatabaseWebService.Controllers
{
    [Route("api")]
    [ApiController]
    public class MainController : ControllerBase
    {
       [HttpGet("{typename}")]
       public ActionResult<List<object>> GetAdmin(string typename)
       {
           var output = new List<object>();
          
           Type type = null;
            
           try
           {
               type = Type.GetType($"DatabaseWebService.DatabaseObjects.{typename}");
               if (type == null) throw new Exception($"The requested datatype {typename} doesnt exist.");
               
               var instance = Activator.CreateInstance(type);
               
               foreach (var (key, value) in Request.Query)
               {
                   var prop = type.GetProperties().FirstOrDefault(p => p.Name.ToLower().Equals(key.ToLower()));
                   if (prop == null) continue;
                   prop.SetValue(instance, value);
               }
               
               output = DbSelector.MatchTemplate(instance);
           }
           catch (TargetException)
           {
               var text = type.GetProperties().Aggregate("Supplied a faulty object to the Server. The expected Structure is:\n", (current, prop) => current + $"{prop.Name} : {prop.PropertyType.Name}\n");
               throw new Exception(text);
           }

           return output;
       }
        
        [HttpPost("{typename}")]
        public ActionResult<bool> GenericPost(string typename, [FromBody] JObject post)
        {
            Type type = null;
            
            try
            {
                type = Type.GetType($"DatabaseWebService.DatabaseObjects.{typename}");
                if (type == null) throw new Exception("The requested datatype doesnt exist.");
                
                DbSelector.Insert(post.ToObject(type));
                return true;
            }
            catch (TargetException)
            {
                var text = type.GetProperties().Aggregate("Supplied a faulty object to the Server. The expected Structure is:\n", (current, prop) => current + $"{prop.Name} : {prop.PropertyType.Name}\n");
                throw new Exception(text);
            }
        }
        
        [HttpPut("{typename}/{id}")]
        public ActionResult<bool> GenericPut(string typename, int id, [FromBody] JObject post)
        {
            Type type = null;
            
            try
            {
                type = Type.GetType($"DatabaseWebService.DatabaseObjects.{typename}");
                if (type == null) throw new Exception($"The requested datatype {typename} doesnt exist.");
                
                DbSelector.Update(id, post.ToObject(type));
                return true;
            }
            catch (TargetException)
            {
                var text = type.GetProperties().Aggregate("Supplied a faulty object to the Server. The expected Structure is:\n", (current, prop) => current + $"{prop.Name} : {prop.PropertyType.Name}\n");
                throw new Exception(text);
            }
        }
  
        [HttpDelete("{typename}/{id}")]
        public ActionResult<bool> DeleteAdmin(string typename, int id)
        {
            Type type = null;

            try
            {
                type = Type.GetType($"DatabaseWebService.DatabaseObjects.{typename}");
                if (type == null) throw new Exception($"The requested datatype {typename} doesnt exist.");
                DbSelector.Delete(id, type);

                return true;
            }
            catch (TargetException)
            {
                var text = type.GetProperties().Aggregate("Supplied a faulty object to the Server. The expected Structure is:\n", (current, prop) => current + $"{prop.Name} : {prop.PropertyType.Name}\n");
                throw new Exception(text);
            }
        }
    }
}