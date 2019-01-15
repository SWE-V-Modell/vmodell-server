using System;
using System.Collections.Generic;
using DatabaseWebService.DatabaseObjects;
using Microsoft.AspNetCore.Mvc;

namespace DatabaseWebService.Controllers
{
    [Route("api")]
    [ApiController]
    public class MainController : ControllerBase
    {
        [HttpGet("admin")]
        public ActionResult<List<Admin>> GetAdmin([FromQuery] string name, [FromQuery] string email,
            [FromQuery] int? id)
        {
            var admin = new Admin
            {
                Id = id,
                Name = name,
                EMail = email
            };

            return DbSelector.Select(admin);
        }

        [HttpPost("admin")]
        public ActionResult<bool> PostAdmin(Admin admin)
        {
            try
            {
                DbSelector.Insert(admin);
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        [HttpPut("admin/{id}")]
        public ActionResult<bool> PutAdmin(int id, [FromBody] Admin admin)
        {
            DbSelector.Update(id, admin);

            return true;
        }

        [HttpDelete("Admin/{id}")]
        public ActionResult<bool> DeleteAdmin(int id)
        {
            DbSelector.Delete<Admin>(id);

            return true;
        }

        [HttpGet("student")]
        public ActionResult<List<Student>> GetStudent([FromQuery] string name, [FromQuery] int? gruppe,
            [FromQuery] string email, [FromQuery] int? id)
        {
            var student = new Student
            {
                Id = id,
                Name = name,
                Gruppe = gruppe,
                EMail = email
            };

            return DbSelector.Select(student);
        }

        [HttpPost("student")]
        public ActionResult<bool> PostStudent(Student student)
        {
            try
            {
                DbSelector.Insert(student);
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        [HttpPut("student/{id}")]
        public ActionResult<bool> PutStudent(int id, [FromBody] Student student)
        {
            DbSelector.Update(id, student);

            return true;
        }

        [HttpDelete("student/{id}")]
        public ActionResult<bool> DeleteStudent(int id)
        {
            DbSelector.Delete<Student>(id);

            return true;
        }

        [HttpGet("veranstalter")]
        public ActionResult<List<Veranstalter>> GetVeranstalter([FromQuery] string anmerkung, [FromQuery] int? modul,
            [FromQuery] string datum, [FromQuery] string von, [FromQuery] string bis, [FromQuery] int? id)
        {
            DateTime.TryParse(von, out var vonParsed);
            DateTime.TryParse(bis, out var bisParsed);
            DateTime.TryParse(datum, out var datParsed);

            var veranstalter = new Veranstalter
            {
                Id = id,
                Modul = modul,
                Anmerkung = anmerkung,
                Von = vonParsed,
                Bis = bisParsed,
                Datum = datParsed
            };

            return DbSelector.Select(veranstalter);
        }

        [HttpPost("veranstalter")]
        public ActionResult<bool> PostVeranstalter(Veranstalter veranstalter)
        {
            try
            {
                DbSelector.Insert(veranstalter);
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        [HttpPut("veranstalter/{id}")]
        public ActionResult<bool> PutVeranstalter(int id, [FromBody] Veranstalter veranstalter)
        {
            DbSelector.Update(id, veranstalter);

            return true;
        }

        [HttpDelete("veranstalter/{id}")]
        public ActionResult<bool> DeleteVeranstalter(int id)
        {
            DbSelector.Delete<Veranstalter>(id);

            return true;
        }

        [HttpGet("modul")]
        public ActionResult<List<Modul>> GetModul([FromQuery] string beschreibung, [FromQuery] int? dozent,
            [FromQuery] int? id)
        {
            var modul = new Modul
            {
                Id = id,
                Dozent = dozent,
                Beschreibung = beschreibung
            };

            return DbSelector.Select(modul);
        }

        [HttpPost("modul")]
        public ActionResult<bool> PostModul(Modul modul)
        {
            try
            {
                DbSelector.Insert(modul);
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        [HttpPut("modul/{id}")]
        public ActionResult<bool> PutModul(int id, [FromBody] Modul modul)
        {
            DbSelector.Update(id, modul);

            return true;
        }

        [HttpDelete("modul/{id}")]
        public ActionResult<bool> DeleteModul(int id)
        {
            DbSelector.Delete<Modul>(id);

            return true;
        }

        [HttpGet("gruppe")]
        public ActionResult<List<Gruppe>> GetGruppe([FromQuery] int? id)
        {
            var gruppe = new Gruppe
            {
                Id = id
            };

            return DbSelector.Select(gruppe);
        }

        [HttpPost("gruppe")]
        public ActionResult<bool> PostStudent(Gruppe gruppe)
        {
            try
            {
                DbSelector.Insert(gruppe);
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        [HttpPut("gruppe/{id}")]
        public ActionResult<bool> PutGruppe(int id, [FromBody] Gruppe gruppe)
        {
            DbSelector.Update(id, gruppe);

            return true;
        }

        [HttpDelete("gruppe/{id}")]
        public ActionResult<bool> DeleteGruppe(int id)
        {
            DbSelector.Delete<Gruppe>(id);

            return true;
        }

        [HttpGet("dozent")]
        public ActionResult<List<Dozent>> GetDozent([FromQuery] string name, [FromQuery] string email,
            [FromQuery] int? id)
        {
            var dozent = new Dozent
            {
                Id = id,
                Name = name,
                EMail = email
            };

            return DbSelector.Select(dozent);
        }

        [HttpPost("dozent")]
        public ActionResult<bool> PostDozent(Dozent dozent)
        {
            try
            {
                DbSelector.Insert(dozent);
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        [HttpPut("dozent/{id}")]
        public ActionResult<bool> PutDozent(int id, [FromBody] Dozent dozent)
        {
            DbSelector.Update(id, dozent);

            return true;
        }

        [HttpDelete("dozent/{id}")]
        public ActionResult<bool> DeleteDozent(int id)
        {
            DbSelector.Delete<Dozent>(id);

            return true;
        }

        [HttpGet("veranstaltungsgruppe")]
        public ActionResult<List<Veranstaltungsgruppe>> GetVeranstaltungsGruppe([FromQuery] int? veranstaltung,
            [FromQuery] int? gruppe, [FromQuery] int? id)
        {
            var veranstaltungsGruppe = new Veranstaltungsgruppe
            {
                Id = id,
                Gruppe = gruppe,
                Veranstaltung = veranstaltung
            };


            return DbSelector.Select(veranstaltungsGruppe);
        }

        [HttpPost("veranstaltungsgruppe")]
        public ActionResult<bool> PostVeranstaltungsgruppe(Veranstaltungsgruppe veranstaltungsgruppe)
        {
            try
            {
                DbSelector.Insert(veranstaltungsgruppe);
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        [HttpPut("veranstaltungsgruppe/{id}")]
        public ActionResult<bool> PutVeranstaltungsgruppe(int id, [FromBody] Veranstaltungsgruppe veranstaltungsgruppe)
        {
            DbSelector.Update(id, veranstaltungsgruppe);

            return true;
        }

        [HttpDelete("veranstaltungsgruppe/{id}")]
        public ActionResult<bool> DeleteVeranstaltungsgruppe(int id)
        {
            DbSelector.Delete<Veranstaltungsgruppe>(id);

            return true;
        }
    }
}