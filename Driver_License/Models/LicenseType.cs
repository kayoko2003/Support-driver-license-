using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class LicenseType
{
    public int LicenseTypeId { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Exam> Exams { get; set; } = new List<Exam>();

    public virtual ICollection<Penalize> Penalizes { get; set; } = new List<Penalize>();

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();
}
