   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   ,    &Driver_License.SelectLicenseTypeWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	   -   5          � Title$  SelectLicenseTypeWindow��5   	   $	��579��6)   $	��400��66    � WindowStartupLocation$ CenterScreen=�5	        � 
ResizeMode$ NoResize=�6E    � 	Resources 5
         OpenMenu �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value  	CloseMenu��%�  &	        &	 �     �� 5   
   .��5      U� $ (FrameworkElement.Width)�6,   $ GridMenu��6a   .\�5        $ 0��6'   $ 0Q�63     5      $ 0:0:0.5��6'   $	 100Q�69   5      5      �� 5   
   .��5      U� $ (FrameworkElement.Width)�6,   $ GridMenu��6a   .\�5        $ 0��6'   $	 100Q�63     5      $ 0:0:0.5��6'   $ 0Q�69   5      5      5       � Triggers 5      :� 5   
   	 :� RoutedEvent$	 ButtonBase.Click��6   
 :� 
SourceName$
 ButtonOpenMenu��66   .[�5      �� #��[  6   5      :� 5   
   $	 ButtonBase.Click��6   $
 ButtonCloseMenu��66   .[�5      �� #��[ 6   5      .��5       � ���#5E97F6.+�5!   
   �  � RowDefinitions 5"      �� 5#      $
��Auto �6    �� 5$      $��2 �6    �� 5%      $��* �6    �� 5&      $��30 �6    .+�5(      �� -   5         ��Name$ ButtonOpenMenu��5(      $��40��6-   $��50��69   $
��Left=�6D   $��Center=�6_   ���	#FF31577E��6{   Z� ��6�   Z� .��5)      �� $��Images/Icon/Menu.png��6   5*      �� 5+      $"��Chọn loại bằng lái xe��6   $��0��65   $��Center=�6B   $��20(�6_   $
��0,10q�6m   
���   �6{   �� 5,      $��1��6   
���   �$��0,0,0,2q�66   $��Stretch=�6P   $��Bottom=�6n   �� 5-      -   5         ��Name$ dgLiencesType��5-      $��2��6-   $��Center=�6:   $��Center=�6W   $��0q�6r   
������  5.       �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius �� Padding �� Triggers P� Property P� Value �� ScaleX �� ScaleY��%u  '��       '�� t     �� 5/      " ��6   .�50      ��  � ��$ Hidden=�6J   �� 51       � ��$ Hidden=�6H   52      �� 53      " ��6   .�54      ��  � �� 55      �� 56   "   " ��62   .R�57   &   �� #��z��6-   #��z��58   -   #��z��59   -   $ 10��5:   -   $ 5q�6?   ._�5;   *   �� $��Center=�6;   $��Center=�6X   5<   '   5=   #   5?       5@      P� 5A       �@J�IsMouseOver$
 True��6=   . �5B   "   ��  � z� 5C   &   �� 5D   *   $	 1.1Q�69   $	 1.1Q�6F   5F   #   �� 5G   "    �@J�RenderTransformOrigin$ 0.5,0.5&�6J   5H      5J      5K      ��5L      �� 5M      .R�5N      �� -   5        $	��300��5N   V   $��50��6b   $��10q�6n   ���#4A148C
���������6!   �� *Name+6�   5O      5Q      5R      � 5S   
   -   5         �Name$ GridMenu��5S      $��0��6!   $
��Left=�6+   ���	#FF31577E J� Effect 5T      3  -System.Windows.Media.Effects.DropShadowEffect  5U         
BlurRadius$ 2Q�6#      ShadowDepth$ 1Q�62      Color$ 	#FFAEAEAE��6B   .+�5W      �� .+�5X      � $��47��6   
������� J� RenderTransformOrigin$ 0.5,0.5&�66   z�5Y      V� 5Z      .~�5[      �� �� 5\      �� 5]      T� 5^      5_      .+�5a      �� -   5        $ ButtonCloseMenu��5a      $y�	Collapsed=�67   $��40��6N   $��50��6Z   $��Right=�6e   $��Center=�6�   ���	#FF31577E��6�   Z� ��6�   Z� .��5b      �� $��Images/Icon/Menu.png��6    5c      5d      �� 5e      -   5         ��Name$ ListViewMenu��5e      ���	#FF5C99D6$��Disabled=�6H   .@�5f      �� -   5          ��Name$  ItemPractice��5f   #   $��60��69   
�������.��5g      �� ! �� Orientation$! 
Horizontal=�6%   .+�5h      �� $��Phân loại��6(   $��Center=�69   $��20 10q�6T   5i      5j      �� 5k      -	   5        $  ItemProfile��5k   #   $��60��68   .��5l      �� $! 
Horizontal=�6%   .+�5m      �� $��Profile��6(   $��Center=�67   $��20 10q�6R   5n      5o      �� 5p      -
   5        $  manage��5p   F   $��60��6#   $y�	Collapsed=�6/   .��5q      �� $! 
Horizontal=�6%   .+�5r      �� $��
Quản lý��6(   $��Center=�67   $��20 10q�6S   5s      5t      5u      5v      �� 5w      -   5        $��Đăng xuất��5w      $��Bottom=�6)   $��Center=�6D   $	��100��6a   $��30��6m   6y   5x      5y      5z      