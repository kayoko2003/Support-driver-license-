using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class Exam
{
    public int ExamId { get; set; }

    public string? Name { get; set; }

    public int? LicenseTypeId { get; set; }

    public int? CreateBy { get; set; }

    public bool? IsDelete { get; set; }

    public virtual Account? CreateByNavigation { get; set; }

    public virtual LicenseType? LicenseType { get; set; }

    public virtual ICollection<Result> Results { get; set; } = new List<Result>();

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();
}
