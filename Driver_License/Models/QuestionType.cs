using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class QuestionType
{
    public int QuestionTypeId { get; set; }

    public string? Content { get; set; }

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();
}
