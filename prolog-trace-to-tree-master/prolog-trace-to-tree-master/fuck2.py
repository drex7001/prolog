import random
from graphviz import Digraph

def replace_variables_with_chars(trace):
    # Find all variables starting with an underscore and replace them with random letters
    variables = set()
    for line in trace.splitlines():
        for part in line.split():
            if part.startswith('_'):
                variables.add(part)
    
    # Create a dictionary for variable replacement
    replacements = {var: chr(65 + i) for i, var in enumerate(variables)}
    
    # Replace variables in the trace
    for var, char in replacements.items():
        trace = trace.replace(var, char)
    
    return trace

def parse_trace(trace):
    tree = {}
    stack = []
    
    for line in trace.splitlines():
        if "Call:" in line or "Exit:" in line:
            # Extract depth and goal
            depth = int(line.split()[1].strip('()'))
            goal = line.split(' ', 3)[-1].strip()

            if len(stack) < depth:
                stack.append(goal)
            else:
                while len(stack) >= depth:
                    stack.pop()
                stack.append(goal)
                
            if len(stack) > 1:
                parent = stack[-2]
                child = stack[-1]
                tree.setdefault(parent, []).append(child)
    
    return tree

def draw_sld_tree(tree, final_goal):
    dot = Digraph(comment="SLD Tree")
    
    # Add nodes and edges to the graph
    for parent, children in tree.items():
        for child in children:
            dot.node(parent, parent, shape='ellipse')
            dot.node(child, child, shape='ellipse')
            dot.edge(parent, child)
    
    # Add the final goal node
    if final_goal:
        final_node = f'N = {final_goal}'
        last_key = list(tree.keys())[-1]  # The last key in the tree dictionary
        dot.node(final_node, final_node, shape='ellipse')
        dot.edge(last_key, final_node)
    
    dot.render('sld_tree', format='png', cleanup=True)
    print(dot.source)

# Your trace string
trace = """
Call: (12) list_min([20, 9, 13, 14, 6, 8], _4160) ? creep
Call: (13) list_min([9, 13, 14, 6, 8], _5560) ? creep
Call: (14) list_min([13, 14, 6, 8], _6372) ? creep
Call: (15) list_min([14, 6, 8], _7184) ? creep
Call: (16) list_min([6, 8], _7996) ? creep
Call: (17) list_min([8], _8808) ? creep
Exit: (17) list_min([8], 8) ? creep
Call: (17) min(6, 8, _7996) ? creep
Call: (18) 6=<8 ? creep
Exit: (18) 6=<8 ? creep
Exit: (17) min(6, 8, 6) ? creep
Exit: (16) list_min([6, 8], 6) ? creep
Call: (16) min(14, 6, _7184) ? creep
Call: (17) 14=<6 ? creep
Fail: (17) 14=<6 ? creep
Redo: (16) min(14, 6, _7184) ? creep
Call: (17) 14>6 ? creep
Exit: (17) 14>6 ? creep
Exit: (16) min(14, 6, 6) ? creep
Exit: (15) list_min([14, 6, 8], 6) ? creep
Call: (15) min(13, 6, _6372) ? creep
Call: (16) 13=<6 ? creep
Fail: (16) 13=<6 ? creep
Redo: (15) min(13, 6, _6372) ? creep
Call: (16) 13>6 ? creep
Exit: (16) 13>6 ? creep
Exit: (15) min(13, 6, 6) ? creep
Redo: (16) min(14, 6, _7184) ? creep
Call: (17) 14>6 ? creep
Exit: (17) 14>6 ? creep
Exit: (16) min(14, 6, 6) ? creep
Exit: (15) list_min([14, 6, 8], 6) ? creep
Call: (15) min(13, 6, _6372) ? creep
Call: (16) 13=<6 ? creep
Fail: (16) 13=<6 ? creep
Redo: (15) min(13, 6, _6372) ? creep
Call: (16) 13>6 ? creep
Exit: (16) 13>6 ? creep
Exit: (15) min(13, 6, 6) ? creep
Exit: (14) list_min([13, 14, 6, 8], 6) ? creep
Call: (16) 13>6 ? creep
Exit: (16) 13>6 ? creep
Exit: (15) min(13, 6, 6) ? creep
Exit: (14) list_min([13, 14, 6, 8], 6) ? creep
Call: (14) min(9, 6, _5560) ? creep
Exit: (15) min(13, 6, 6) ? creep
Exit: (14) list_min([13, 14, 6, 8], 6) ? creep
Call: (14) min(9, 6, _5560) ? creep
Exit: (14) list_min([13, 14, 6, 8], 6) ? creep
Call: (14) min(9, 6, _5560) ? creep
Call: (15) 9=<6 ? creep
Fail: (15) 9=<6 ? creep
Call: (15) 9=<6 ? creep
Fail: (15) 9=<6 ? creep
Redo: (14) min(9, 6, _5560) ? creep
Call: (15) 9>6 ? creep
Fail: (15) 9=<6 ? creep
Redo: (14) min(9, 6, _5560) ? creep
Call: (15) 9>6 ? creep
Exit: (15) 9>6 ? creep
Redo: (14) min(9, 6, _5560) ? creep
Call: (15) 9>6 ? creep
Exit: (15) 9>6 ? creep
Call: (15) 9>6 ? creep
Exit: (15) 9>6 ? creep
Exit: (15) 9>6 ? creep
Exit: (14) min(9, 6, 6) ? creep
Exit: (14) min(9, 6, 6) ? creep
Exit: (13) list_min([9, 13, 14, 6, 8], 6) ? creep
Call: (13) min(20, 6, _58) ? creep
Call: (14) 20=<6 ? creep
Fail: (14) 20=<6 ? creep
Redo: (13) min(20, 6, _58) ? creep
Call: (14) 20>6 ? creep
Exit: (14) 20>6 ? creep
Exit: (13) min(20, 6, 6) ? creep
Exit: (12) list_min([20, 9, 13, 14, 6, 8], 6) ? creep
N = 6 .
"""

# Replace variables with characters
trace = replace_variables_with_chars(trace)

# Parse the trace and draw the tree
final_goal = '6'  # The final goal from your trace
tree = parse_trace(trace)
draw_sld_tree(tree, final_goal)
