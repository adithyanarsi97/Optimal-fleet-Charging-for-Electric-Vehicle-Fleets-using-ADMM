function [x]= profile(e,N_EV,E_req1,E_req2)

for i=1:N_EV
    for j=1:24
        if(rem(i,4)==1)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                    x(i,[1:14])=5;
                    x(i,[15:24])=16;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:14])=5;
                        x(i,[15:24])=25;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                            x(i,[1:14])=5;
                            x(i,[15:24])=40;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:14])=16;
                                x(i,[15:24])=5;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:14])=16;
                                        x(i,[15:24])=25;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:14])=16;
                                           x(i,[15:24])=40;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:14])=25;
                                              x(i,[15:24])=5;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:14])=25;
                                                  x(i,[15:24])=16;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:14])=25;
                                                          x(i,[15:24])=40;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:14])=40;
                                                              x(i,[15:24])=5;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160 ) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:14])=40;
                                                                   x(i,[15:24])=16;
                                                               else
                                                                   if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 &&E_req2(i,e)<=100))
                                                                       x(i,[1:14])=40;
                                                                       x(i,[15:24])=25;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else   
        if(rem(i,4)==2)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                    x(i,[1:6])=5;
                    x(i,[7:20])=16;
                    x(i,[21:24])=5;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:6])=5;
                        x(i,[7:20])=25;
                        x(i,[21:24])=5;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                            x(i,[1:6])=5;
                            x(i,[7:20])=40;
                            x(i,[21:24])=5;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:6])=16;
                                x(i,[7:20])=5;
                                x(i,[21:24])=16;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<64) && (E_req2(i,e)>20 && E_req2(i,e)<64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:6])=16;
                                        x(i,[7:20])=25;
                                        x(i,[21:24])=16;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:6])=16;
                                           x(i,[7:20])=40;
                                           x(i,[21:24])=16;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:6])=25;
                                              x(i,[7:20])=5;
                                              x(i,[21:24])=25;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:6])=25;
                                                  x(i,[7:20])=16;
                                                  x(i,[21:24])=25;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:6])=25;
                                                          x(i,[7:20])=40;
                                                          x(i,[21:24])=25;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:6])=40;
                                                              x(i,[7:20])=5;
                                                              x(i,[21:24])=40;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:6])=40;
                                                                   x(i,[7:20])=16;
                                                                   x(i,[21:24])=40;
                                                               else
                                                                   if((E_req1(i,e)> 100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                                       x(i,[1:6])=40;
                                                                       x(i,[7:20])=25;
                                                                       x(i,[21:24])=40;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else   
        if(rem(i,4)==3)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                    x(i,[1:4])=5;
                    x(i,[5:10])=16;
                    x(i,[11:24])=5;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:4])=5;
                        x(i,[5:10])=25;
                        x(i,[11:24])=5;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                            x(i,[1:4])=5;
                            x(i,[5:10])=40;
                            x(i,[11:24])=5;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:4])=16;
                                x(i,[5:10])=5;
                                x(i,[11:24])=16;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:4])=16;
                                        x(i,[5:10])=25;
                                        x(i,[11:24])=16;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:4])=16;
                                           x(i,[5:10])=40;
                                           x(i,[11:24])=16;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:4])=25;
                                              x(i,[5:10])=5;
                                              x(i,[11:24])=25;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:4])=25;
                                                  x(i,[5:10])=16;
                                                  x(i,[11:24])=25;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)> 64 && E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:4])=25;
                                                          x(i,[5:10])=40;
                                                          x(i,[11:24])=25;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:4])=40;
                                                              x(i,[5:10])=5;
                                                              x(i,[11:24])=40;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:4])=40;
                                                                   x(i,[5:10])=16;
                                                                   x(i,[11:24])=40;
                                                               else
                                                                   if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                                       x(i,[1:4])=40;
                                                                       x(i,[5:10])=25;
                                                                       x(i,[11:24])=40;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else   
        if(rem(i,4)==0)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 &&E_req2(i,e)<=64))
                    x(i,[1:8])=5;
                    x(i,[9:18])=16;
                    x(i,[19:24])=5;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:8])=5;
                        x(i,[9:18])=25;
                        x(i,[19:24])=5;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                            x(i,[1:8])=5;
                            x(i,[9:18])=40;
                            x(i,[19:24])=5;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:8])=16;
                                x(i,[9:18])=5;
                                x(i,[19:24])=16;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:8])=16;
                                        x(i,[9:18])=25;
                                        x(i,[19:24])=16;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:8])=16;
                                           x(i,[9:18])=40;
                                           x(i,[19:24])=16;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:8])=25;
                                              x(i,[9:18])=5;
                                              x(i,[19:24])=25;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:8])=25;
                                                  x(i,[9:18])=16;
                                                  x(i,[19:24])=25;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>64 &&E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:8])=25;
                                                          x(i,[9:18])=40;
                                                          x(i,[19:24])=25;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:8])=40;
                                                              x(i,[9:18])=5;
                                                              x(i,[19:24])=40;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:8])=40;
                                                                   x(i,[9:18])=16;
                                                                   x(i,[19:24])=40;
                                                               else
                                                                   if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                                       x(i,[1:8])=40;
                                                                       x(i,[9:18])=25;
                                                                       x(i,[19:24])=40;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        end
        end
        end
    end
end