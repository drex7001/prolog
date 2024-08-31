from pptree import *
import os


def get_first_word(line):
    if line is "":
        return
    words = line.split()
    if len(words) > 0:
        first_word = words[0]
        return first_word


def add_node(current, line):
    if current is None:
        return Node("head" + line, None)
    else:
        return Node(line, current)


with open("file.txt", 'r') as trace_file:
    current = None

    while True:
        line = trace_file.readline()
        if line.strip() == "":  # run till it face an empty string.
            break
        first_word = get_first_word(line)
        if current is None:
            call_tree = add_node(current, line)
            current = call_tree
        elif first_word == "Call:":
            current = add_node(current, line)
        elif first_word == "Exit:":
            add_node(current, line)  # get_assignment(line))
            current = current.parent
        elif first_word == "Fail:":
            add_node(current, line)
            current = current.parent
        elif first_word == "Redo:":
            current = add_node(current, line)

print_tree(call_tree)

# from graphviz import Digraph
# import re

# def parse_trace(trace):
#     lines = trace.split('\n')
#     root = None
#     current_node = None
#     nodes = {}
    
#     for line in lines:
#         line = line.strip()
#         if not line:
#             continue
        
#         match = re.match(r'(Call|Exit|Fail|Redo):\s*\((\d+)\)\s*(.*)\s*\?\s*creep', line)
#         if match:
#             action, depth, content = match.groups()
#             depth = int(depth)
            
#             if action == 'Call':
#                 new_node = {'content': content, 'children': [], 'parent': current_node, 'depth': depth}
#                 if current_node:
#                     current_node['children'].append(new_node)
#                 else:
#                     root = new_node
#                 current_node = new_node
#                 nodes[depth] = current_node
#             elif action in ['Exit', 'Fail']:
#                 if current_node and current_node['depth'] == depth:
#                     current_node['result'] = action
#                     current_node = current_node['parent']
#             elif action == 'Redo':
#                 if depth in nodes:
#                     current_node = nodes[depth]
    
#     return root

# def create_graph(root):
#     dot = Digraph(comment='Prolog Trace Tree')
#     dot.attr(rankdir='TB')
    
#     def add_node(node, parent_id=None):
#         node_id = str(id(node))
#         label = f"{node['content']}\n{node.get('result', '')}"
#         dot.node(node_id, label)
#         if parent_id:
#             dot.edge(parent_id, node_id)
#         for child in node['children']:
#             add_node(child, node_id)
    
#     add_node(root)
#     return dot

# # Main execution
# trace = """
# Call: (12) list_min([20, 9, 13, 14, 6, 8], _4160) ? creep
# Call: (13) list_min([9, 13, 14, 6, 8], _5560) ? creep
# ...
# Exit: (12) list_min([20, 9, 13, 14, 6, 8], 6) ? creep
# """  # Replace with your full trace

# root = parse_trace(trace)
# graph = create_graph(root)
# graph.render('prolog_trace_tree', format='png', cleanup=True)
# print("Tree visualization saved as 'prolog_trace_tree.png'")
# # from anytree import Node, RenderTree
# # from anytree.exporter import DotExporter

# # def parse_trace(file_path):
# #     root = Node("Root")
# #     current_node = root
    
# #     with open(file_path, 'r') as file:
# #         for line in file:
# #             line = line.strip()
# #             if not line:
# #                 continue
            
# #             parts = line.split(': ', 1)
# #             if len(parts) != 2:
# #                 continue
            
# #             action, content = parts
            
# #             if action == "Call":
# #                 new_node = Node(content, parent=current_node)
# #                 current_node = new_node
# #             elif action in ["Exit", "Fail"]:
# #                 new_node = Node(f"{action}: {content}", parent=current_node)
# #                 current_node = current_node.parent or root
# #             elif action == "Redo":
# #                 current_node = Node(f"Redo: {content}", parent=current_node.parent or root)
    
# #     return root

# # def visualize_tree(root):
# #     # Print tree structure
# #     for pre, _, node in RenderTree(root):
# #         print(f"{pre}{node.name}")
    
# #     # Export tree as a DOT file (can be visualized using Graphviz)
# #     DotExporter(root).to_dotfile("prolog_trace_tree.dot")
# #     print("Tree exported to 'prolog_trace_tree.dot'. You can visualize it using Graphviz.")

# # # Usage
# # file_path = "file.txt"  # Replace with your trace file path
# # root = parse_trace(file_path)
# # visualize_tree(root)