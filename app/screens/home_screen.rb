class HomeScreen < PM::Screen
  title "Your title here"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "Right", action: :nav_right_button

    NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "magic:", userInfo: nil, repeats: true)
  end

  def magic(timer)
    if @hello_world

      # If @hello_world did not have a circular reference, we'd 
      # expect it to be properly deallocated after this is done, which
      # is the case when not assigning append! to an instance-var. 
      @hello_world.removeFromSuperview
      @hello_world = nil
    end
    @hello_world = append!(ARandomView, :hello_world)
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
  
end
