function SWEP:ThinkInspect()
    if self:StillWaiting() or self:GetInSights() then return end
    if self.NextUBGLSwitch and self.NextUBGLSwitch > CurTime() then return end
    if self:GetUBGL() and !self:HasAnimation("inspect_ubgl") then return end
    
    -- self:PlayAnimation("inspect", 1, true)
    if (self:GetOwner():KeyDown(IN_USE) and self:GetOwner():KeyDown(IN_RELOAD)) or self:GetOwner():KeyDown(ARC9.IN_INSPECT) then
        if !self:HasAnimation("enter_inspect") then
            self:PlayAnimation("inspect", 1, true)
            return
        end

        if self:GetInspecting() then
            self:PlayAnimation("idle_inspect", 1, true)
        else
            self:SetInspecting(true)
            self:PlayAnimation("enter_inspect", 1, true)
        end
    elseif self:GetInspecting() then
        self:SetInspecting(false)
        self:PlayAnimation("exit_inspect", 1, true)
    end
end