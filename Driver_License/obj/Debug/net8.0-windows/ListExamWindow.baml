   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   #    Driver_License.ListExamWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  ListExamWindow��5   	   $	��579��6    $	��400��6-    � WindowStartupLocation$ CenterScreen=�5	   	    � 
ResizeMode$ NoResize=�6.   .��5
      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   ���#1b7a90$	��Top=�6C   $��50��6[   .+�5      �� -   5         ��Name$ btnBack��5      $
��auto��6&   $��30��63   
������ $��0q�6n   $��Center=�6�   $
��10,0q�6�   .��5      �� $��Images/Icon/Back.png��6   $��20��66   $��30��6A   5      �� 5      $ ��Danh sách bài kiểm tra��6   $��Center=�66   
�������$��16(�6d   $
��Bold"�6r   $
��10,0q�6�   �� 5      -   5        $ btnAdd��5      $
��auto��6%   $��30��62   
������ $��0q�6l   $��Center=�6�   $��120,0q�6�   .��5      �� $��Images/Icon/Add.png��6   $��25��65   $��30��6@   5      5      �� 5   
   $ 
Horizontal=�6   $��Center=�6.   $��1��6K   $��50��6X   .+�5      �� -   5         ��Name$ search��5      $��2��6&   $��30��63   $��Center=�6?   $	��185��6\   6�   �� 5      -   5        $��cbLicenseType��5      $��30��6,   $��5,0,0,0q�6c    J� RenderTransformOrigin$ 0.5,0.5&�6t   $	��185��6�   5      &   System.Windows.Controls.DataGrid  5    
   -   5          Name$ ExamDataGrid��5       	   AutoGenerateColumns$	 False��6)   
   
IsReadOnly$

 True��6E   $��10q�6W   $��3��6c   $��Hidden=�6p      Columns 5!      4  .System.Windows.Controls.DataGridTemplateColumn  5"      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ 30 65      CellTemplate 5#      �� 5$      .R�5%      �� $
��Wrap=�6@   ��6(   �� *ExamId+6@   5&      5(        5)      $ 
Nội dung��6)   $ * 6;    5*      �� 5+      .R�5,      �� $
��Wrap=�6>   ��6(   �� *Name+6>   5-      5/        50      $ Phân loại��6)   $ * 6<    51      �� 52      .R�53      �� $
��Wrap=�6J   ��6(   �� *LicenseType.Name+6J   54      56        57      $ 30 6)    58      �� 59      .R�5:      �� -   5        .��5;   "   �� $��Images/Icon/Pencil.png��6(   $
��auto��6H   $
��auto��6U   5<      5=      5?      5A      5B      5C      