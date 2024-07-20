using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Driver_License.Models;

public partial class SupportLicenseContext : DbContext
{
    public SupportLicenseContext()
    {
    }

    public static SupportLicenseContext INSTANCE = new SupportLicenseContext();

    public SupportLicenseContext(DbContextOptions<SupportLicenseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<Answer> Answers { get; set; }

    public virtual DbSet<Exam> Exams { get; set; }

    public virtual DbSet<LicenseType> LicenseTypes { get; set; }

    public virtual DbSet<Penalize> Penalizes { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<QuestionType> QuestionTypes { get; set; }

    public virtual DbSet<Result> Results { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer(config.GetConnectionString("DBContext"));
        }
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.HasKey(e => e.AccountId).HasName("PK__Account__B19E45C9D6F84D25");

            entity.ToTable("Account");

            entity.Property(e => e.AccountId).HasColumnName("Account_ID");
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.IsAdmin)
                .HasDefaultValue(false)
                .HasColumnName("isAdmin");
            entity.Property(e => e.IsDelete).HasColumnName("isDelete");
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.UserName)
                .HasMaxLength(50)
                .HasColumnName("User_Name");
        });

        modelBuilder.Entity<Answer>(entity =>
        {
            entity.HasKey(e => e.AnswerId).HasName("PK__Answer__36918F5872D6B36A");

            entity.ToTable("Answer");

            entity.Property(e => e.AnswerId).HasColumnName("Answer_ID");
            entity.Property(e => e.Content).HasMaxLength(200);
            entity.Property(e => e.CorrectAnswer).HasColumnName("Correct_Answer");
            entity.Property(e => e.QuestionId).HasColumnName("Question_ID");
            entity.Property(e => e.UserSelected)
                .HasMaxLength(50)
                .HasColumnName("User_Selected");

            entity.HasOne(d => d.Question).WithMany(p => p.Answers)
                .HasForeignKey(d => d.QuestionId)
                .HasConstraintName("FK__Answer__Question__4E88ABD4");
        });

        modelBuilder.Entity<Exam>(entity =>
        {
            entity.HasKey(e => e.ExamId).HasName("PK__Exam__C782CA7964015834");

            entity.ToTable("Exam");

            entity.Property(e => e.ExamId).HasColumnName("Exam_ID");
            entity.Property(e => e.CreateBy).HasColumnName("Create_By");
            entity.Property(e => e.IsDelete).HasColumnName("Is_Delete");
            entity.Property(e => e.LicenseTypeId).HasColumnName("License_Type_ID");
            entity.Property(e => e.Name).HasMaxLength(100);

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.Exams)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_Exam_Account");

            entity.HasOne(d => d.LicenseType).WithMany(p => p.Exams)
                .HasForeignKey(d => d.LicenseTypeId)
                .HasConstraintName("FK__Exam__License_Ty__59FA5E80");
        });

        modelBuilder.Entity<LicenseType>(entity =>
        {
            entity.HasKey(e => e.LicenseTypeId).HasName("PK__LicenseT__2359AD0AD028DB33");

            entity.ToTable("LicenseType");

            entity.Property(e => e.LicenseTypeId).HasColumnName("License_Type_ID");
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Penalize>(entity =>
        {
            entity.HasKey(e => e.PenalizeId).HasName("PK__penalize__804B87DA73A95634");

            entity.ToTable("Penalize");

            entity.Property(e => e.PenalizeId).HasColumnName("penalize_id");
            entity.Property(e => e.Content)
                .HasMaxLength(500)
                .HasColumnName("content");
            entity.Property(e => e.CreateBy).HasColumnName("Create_By");
            entity.Property(e => e.Fines)
                .HasMaxLength(100)
                .HasColumnName("fines");
            entity.Property(e => e.IsDelete).HasColumnName("Is_Delete");
            entity.Property(e => e.LicenseTypeId).HasColumnName("License_Type_ID");

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.Penalizes)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_Penalize_Account");

            entity.HasOne(d => d.LicenseType).WithMany(p => p.Penalizes)
                .HasForeignKey(d => d.LicenseTypeId)
                .HasConstraintName("FK__penalize__Licens__41EDCAC5");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.HasKey(e => e.QuestionId).HasName("PK__Question__B0B2E4C65A2A4736");

            entity.ToTable("Question");

            entity.Property(e => e.QuestionId).HasColumnName("Question_ID");
            entity.Property(e => e.Content).HasMaxLength(200);
            entity.Property(e => e.CreateBy).HasColumnName("Create_By");
            entity.Property(e => e.Explain)
                .HasMaxLength(500)
                .IsFixedLength();
            entity.Property(e => e.Image).HasMaxLength(100);
            entity.Property(e => e.IsDelete).HasColumnName("Is_Delete");
            entity.Property(e => e.QuestionTypeId).HasColumnName("Question_Type_ID");

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.Questions)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_Question_Account");

            entity.HasOne(d => d.QuestionType).WithMany(p => p.Questions)
                .HasForeignKey(d => d.QuestionTypeId)
                .HasConstraintName("FK__Question__Questi__4BAC3F29");

            entity.HasMany(d => d.Exams).WithMany(p => p.Questions)
                .UsingEntity<Dictionary<string, object>>(
                    "ExamDetail",
                    r => r.HasOne<Exam>().WithMany()
                        .HasForeignKey("ExamId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_ExamDetail_Exam"),
                    l => l.HasOne<Question>().WithMany()
                        .HasForeignKey("QuestionId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_ExamDetail_Question"),
                    j =>
                    {
                        j.HasKey("QuestionId", "ExamId");
                        j.ToTable("ExamDetail");
                        j.IndexerProperty<int>("QuestionId").HasColumnName("Question_ID");
                        j.IndexerProperty<int>("ExamId").HasColumnName("Exam_ID");
                    });

            entity.HasMany(d => d.LicenseTypes).WithMany(p => p.Questions)
                .UsingEntity<Dictionary<string, object>>(
                    "QuestionLicenseType",
                    r => r.HasOne<LicenseType>().WithMany()
                        .HasForeignKey("LicenseTypeId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__QuestionL__Licen__6C190EBB"),
                    l => l.HasOne<Question>().WithMany()
                        .HasForeignKey("QuestionId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__QuestionL__Quest__6B24EA82"),
                    j =>
                    {
                        j.HasKey("QuestionId", "LicenseTypeId").HasName("PK__Question__02877E16D0DB88B4");
                        j.ToTable("QuestionLicenseType");
                        j.IndexerProperty<int>("QuestionId").HasColumnName("Question_ID");
                        j.IndexerProperty<int>("LicenseTypeId").HasColumnName("License_Type_ID");
                    });
        });

        modelBuilder.Entity<QuestionType>(entity =>
        {
            entity.HasKey(e => e.QuestionTypeId).HasName("PK__Question__509FE2BB36890E7E");

            entity.ToTable("QuestionType");

            entity.Property(e => e.QuestionTypeId).HasColumnName("Question_Type_ID");
            entity.Property(e => e.Content).HasMaxLength(50);
        });

        modelBuilder.Entity<Result>(entity =>
        {
            entity.HasKey(e => new { e.AccountId, e.ExamId }).HasName("PK__Result__3DE6696EC0DFC617");

            entity.ToTable("Result");

            entity.Property(e => e.AccountId).HasColumnName("Account_ID");
            entity.Property(e => e.ExamId).HasColumnName("Exam_ID");
            entity.Property(e => e.Result1).HasColumnName("Result");

            entity.HasOne(d => d.Account).WithMany(p => p.Results)
                .HasForeignKey(d => d.AccountId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Result__Account___531856C7");

            entity.HasOne(d => d.Exam).WithMany(p => p.Results)
                .HasForeignKey(d => d.ExamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Result__Exam_ID__540C7B00");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
