This project is an experiment to see if we can reproduce the effect of tapping
a displayModeButtonItem a splitviewcontroller in SwiftUI.

As of the SwiftUI version that comes with Xcode 11 beta 7, we have a
NavigationView that has two styles: DoubleColumnNavigationViewStyle and
StackNavigationViewStyle. For iPad, the DoubleColumn is preferable because it
nicely shows navigation ("Master") on the left side, and destination ("Detail")
on the right side.

When the iPad is in portrait mode, the navigation disappears in DoubleColumn
style. The old UISplitViewController offers the displayModeButtonItem so the
user can tap and have the left navigation appear. Unfortunately that's not
present yet in SwiftUI.

This code is an experiment and doesn't really work. In portrait, it displays a
backup navigationview on the left side, in the space where the detail would
actually be. It looks good but behaves like a simple navigationview like on the
iPhone; when in fact you'd wish it works like the old UISplitViewController
that's not collapsed.

