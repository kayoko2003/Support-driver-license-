using System;
using System.Collections.Generic;

namespace Driver_License.Models;

public partial class Penalize
{
    public int PenalizeId { get; set; }

    public string Content { get; set; } = null!;

    public string Fines { get; set; } = null!;

    public int? LicenseTypeId { get; set; }

    public int? CreateBy { get; set; }

    public bool? IsDelete { get; set; }

    public virtual Account? CreateByNavigation { get; set; }

    public virtual LicenseType? LicenseType { get; set; }
}
