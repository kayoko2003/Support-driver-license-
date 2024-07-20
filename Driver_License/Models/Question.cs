using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class Question
{
    public int QuestionId { get; set; }

    public string Content { get; set; } = null!;

    public int? QuestionTypeId { get; set; }

    public string? Image { get; set; }

    public string? Explain { get; set; }

    public int? CreateBy { get; set; }

    public bool? IsDelete { get; set; }

    public virtual ICollection<Answer> Answers { get; set; } = new List<Answer>();

    public virtual Account? CreateByNavigation { get; set; }

    public virtual QuestionType? QuestionType { get; set; }

    public virtual ICollection<Exam> Exams { get; set; } = new List<Exam>();

    public virtual ICollection<LicenseType> LicenseTypes { get; set; } = new List<LicenseType>();
}
