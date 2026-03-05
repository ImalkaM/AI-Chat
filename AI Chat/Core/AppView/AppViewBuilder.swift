struct AppViewBuilder<TabBarContent: View, OnBoardContent: View>: View {
    
    var showTabBar: Bool = false
    
    @ViewBuilder var tabBarView: TabBarContent
    @ViewBuilder var onBoardingView: OnBoardContent
    
    var body: some View {
        if showTabBar{
            tabBarView
                .transition(.move(edge: .trailing))
        }else{
            onBoardingView
                .transition(.move(edge: .leading))
        }
    }
}