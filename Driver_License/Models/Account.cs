using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class Account
{
    public int AccountId { get; set; }

    public string UserName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? Email { get; set; }

    public bool? Gender { get; set; }

    public DateOnly? Dob { get; set; }

    public bool? IsAdmin { get; set; }

    public bool? IsDelete { get; set; }

    public virtual ICollection<Exam> Exams { get; set; } = new List<Exam>();

    public virtual ICollection<Penalize> Penalizes { get; set; } = new List<Penalize>();

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Result> Results { get; set; } = new List<Result>();
}
