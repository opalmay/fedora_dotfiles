#!/usr/bin/env python3

# A very simple script to move the current Sway workspace to the next output.
# (Which, in a two output case, will always be the other output.)
#
# Requires python-i3ipc.

from i3ipc import Connection, OutputReply, WorkspaceReply


def get_active_workspace(i3: Connection) -> WorkspaceReply:
    ws = [ws for ws in i3.get_workspaces() if ws.focused]
    if len(ws) != 1:
        raise RuntimeError(
            f"unable to find a single active workspace; got {len(ws)} instead"
        )
    return ws[0]


def get_next_output(i3: Connection, current: str) -> OutputReply:
    # We want to iterate through outputs in string order, so we'll sort this so
    # we have stability.
    outputs = sorted(
        [out for out in i3.get_outputs() if out.active], key=lambda out: out.name
    )
    if len(outputs) <= 1:
        return None

    # Find the "next" output, wrapping if necessary.
    for i, output in enumerate(outputs):
        if output.name == current:
            if i + 1 >= len(outputs):
                return outputs[0]
            return outputs[i + 1]

    # OK, we don't know what the next output is, so let's just return the first
    # one. Shrug. This should only happen if the current workspace is on an
    # unknown output, which shouldn't actually happen.
    return outputs[0]


i3 = Connection()

workspace = get_active_workspace(i3)
output = get_next_output(i3, workspace.output)

i3.command(f"move workspace to output {output.name}")