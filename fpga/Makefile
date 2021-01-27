all: $(DESIGN_NAME).xpr
$(DESIGN_NAME).xpr:
	vivado -mode tcl -source ./scripts/rl_vivado.tcl
gui: $(DESIGN_NAME).xpr
	vivado $(DESIGN_NAME).xpr
clean:
	-rm -rf *.jou *.log solving_maze_by_RL*
