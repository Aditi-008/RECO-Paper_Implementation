function [MC,dist] = mc_motion(MC,target)

dist = norm(target - MC.pos);

MC.pos = target;

end