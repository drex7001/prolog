import re
from graphviz import Digraph

def parse_trace(trace):
    calls = re.findall(r'Call: \((\d+)\) (.*?) \? creep', trace)
    exits = re.findall(r'Exit: \((\d+)\) (.*?) \? creep', trace)
    fails = re.findall(r'Fail: \((\d+)\) (.*?) \? creep', trace)
    return calls, exits, fails

def create_sld_tree(calls, exits, fails):
    dot = Digraph(comment='SLD Resolution Tree')
    dot.attr(rankdir='TB')
    dot.attr('node', shape='ellipse')

    node_map = {}
    last_depth = None  # Initialize last_depth as None

    for depth, call in calls:
        depth = int(depth)
        node_id = f'node_{depth}_{len(node_map.get(depth, []))}'
        label = call.replace('list_min', 'lm').replace('_', '')
        dot.node(node_id, label)
        
        # Only create an edge if last_depth is valid
        if last_depth is not None:
            if depth > last_depth:
                dot.edge(node_map[last_depth][-1], node_id)
            elif depth == last_depth and node_map.get(depth-1):
                dot.edge(node_map[depth-1][-1], node_id)
        
        if depth not in node_map:
            node_map[depth] = []
        node_map[depth].append(node_id)
        last_depth = depth

    for depth, exit in exits:
        depth = int(depth)
        if depth in node_map and node_map[depth]:
            node_id = node_map[depth][-1]
            label = exit.replace('list_min', 'lm').replace('_', '')
            dot.node(node_id, label, color='green')

    for depth, fail in fails:
        depth = int(depth)
        if depth in node_map and node_map[depth]:
            node_id = f'fail_{depth}_{len(node_map[depth])}'
            label = fail.replace('list_min', 'lm').replace('_', '')
            dot.node(node_id, label, color='red')
            dot.edge(node_map[depth][-1], node_id)

    return dot

def main(trace):
    calls, exits, fails = parse_trace(trace)
    tree = create_sld_tree(calls, exits, fails)
    tree.render('sld_tree', format='png', cleanup=True, view=True)
    print("SLD tree has been generated as 'sld_tree.png'")

if __name__ == "__main__":
    # Replace this with the actual trace
    trace = """
    Call: (12) list_max([20, 19, 26, 15, 24, 15], N) ? creep
Call: (13) list_max([19, 26, 15, 24, 15], P1) ? creep
Call: (14) list_max([26, 15, 24, 15], P2) ? creep
Call: (15) list_max([15, 24, 15], P3) ? creep
Call: (16) list_max([24, 15], P4) ? creep
Call: (17) list_max([15], P5) ? creep
Exit: (17) list_max([15], 15) ? creep
Call: (17) max(24, 15, P4) ? creep
Call: (18) 24>=15 ? creep
Exit: (18) 24>=15 ? creep
Exit: (17) max(24, 15, 24) ? creep
Exit: (16) list_max([24, 15], 24) ? creep
Call: (16) max(15, 24, P3) ? creep
Call: (17) 15>=24 ? creep
Fail: (17) 15>=24 ? creep
Redo: (16) max(15, 24, P3) ? creep
Call: (17) 15<24 ? creep
Exit: (17) 15<24 ? creep
Exit: (16) max(15, 24, 24) ? creep
Exit: (15) list_max([15, 24, 15], 24) ? creep
Call: (15) max(26, 24, P2) ? creep
Call: (16) 26>=24 ? creep
Exit: (16) 26>=24 ? creep
Exit: (15) max(26, 24, 26) ? creep
Exit: (14) list_max([26, 15, 24, 15], 26) ? creep
Call: (14) max(19, 26, P1) ? creep
Call: (15) 19>=26 ? creep
Fail: (15) 19>=26 ? creep
Redo: (14) max(19, 26, P1) ? creep
Call: (15) 19<26 ? creep
Exit: (15) 19<26 ? creep
Exit: (14) max(19, 26, 26) ? creep
Exit: (13) list_max([19, 26, 15, 24, 15], 26) ? creep
Call: (13) max(20, 26, N) ? creep
Call: (14) 20>=26 ? creep
Fail: (14) 20>=26 ? creep
Redo: (13) max(20, 26, N) ? creep
Call: (14) 20<26 ? creep
Exit: (14) 20<26 ? creep
Exit: (13) max(20, 26, 26) ? creep
Exit: (12) list_max([20, 19, 26, 15, 24, 15], 26) ? creep
N = 26 .
    """
    main(trace)