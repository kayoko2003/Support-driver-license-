﻿#pragma checksum "..\..\..\AddQuestionWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "956EF8680529F6F3CD2FB0B377F38172CFE20646"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Driver_License;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Driver_License {
    
    
    /// <summary>
    /// AddQuestionWindow
    /// </summary>
    public partial class AddQuestionWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 12 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbQuestionContent;
        
        #line default
        #line hidden
        
        
        #line 15 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbQuestionType;
        
        #line default
        #line hidden
        
        
        #line 18 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox lbLicenseTypes;
        
        #line default
        #line hidden
        
        
        #line 21 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbImage;
        
        #line default
        #line hidden
        
        
        #line 24 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbExplain;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.StackPanel spAnswers;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbAnswer1;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.CheckBox cbCorrect1;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbAnswer2;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\AddQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.CheckBox cbCorrect2;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.4.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Driver_License;component/addquestionwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\AddQuestionWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.4.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.tbQuestionContent = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.cbQuestionType = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 3:
            this.lbLicenseTypes = ((System.Windows.Controls.ListBox)(target));
            return;
            case 4:
            this.tbImage = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.tbExplain = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            
            #line 27 "..\..\..\AddQuestionWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.AddAnswerButton_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.spAnswers = ((System.Windows.Controls.StackPanel)(target));
            return;
            case 8:
            this.tbAnswer1 = ((System.Windows.Controls.TextBox)(target));
            return;
            case 9:
            this.cbCorrect1 = ((System.Windows.Controls.CheckBox)(target));
            
            #line 34 "..\..\..\AddQuestionWindow.xaml"
            this.cbCorrect1.Checked += new System.Windows.RoutedEventHandler(this.CheckBox_Checked);
            
            #line default
            #line hidden
            return;
            case 10:
            this.tbAnswer2 = ((System.Windows.Controls.TextBox)(target));
            return;
            case 11:
            this.cbCorrect2 = ((System.Windows.Controls.CheckBox)(target));
            
            #line 38 "..\..\..\AddQuestionWindow.xaml"
            this.cbCorrect2.Checked += new System.Windows.RoutedEventHandler(this.CheckBox_Checked);
            
            #line default
            #line hidden
            return;
            case 12:
            
            #line 42 "..\..\..\AddQuestionWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.SaveButton_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

