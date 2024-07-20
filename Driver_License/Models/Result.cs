using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class Result
{
    public int AccountId { get; set; }

    public int ExamId { get; set; }

    public int? Result1 { get; set; }

    public virtual Account Account { get; set; } = null!;

    public virtual Exam Exam { get; set; } = null!;
}
