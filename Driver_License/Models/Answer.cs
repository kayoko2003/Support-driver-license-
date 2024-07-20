using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class Answer
{
    public int AnswerId { get; set; }

    public int? QuestionId { get; set; }

    public string Content { get; set; } = null!;

    public bool CorrectAnswer { get; set; }

    public string? UserSelected { get; set; }

    public virtual Question? Question { get; set; }
}
