# Legacy Window-Free Baseline

Branch: exp/legacy_window_free
Base commit: $(git -C C:\dev\RH_demo_clean rev-parse HEAD)

This branch reconstructs the legacy Plan B route without fixing a ctx_real window family.
The goal is to use an abstract RMSLocalContext and avoid the window-cofinality gap.
