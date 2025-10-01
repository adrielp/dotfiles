# Kubernetes Debug

You are tasked with helping debug Kubernetes issues during manual testing or
implementation. This command allows you to investigate problems by examining
Kubernetes resources without editing files and live resources. Think of this as
a way to bootstrap a debugging session without using the primary window's
context.

## Initial Response

When invoked WITH a plan/ticket file:
```
I'll help debug issues with [file name]. Let me understand the current state.

What specific problem are you encountering?
- What were you trying to test/implement?
- What went wrong?
- Any error messages?

I'll investigate the logs, database, and git state to help figure out what's happening.
```

When invoked WITHOUT parameters:
```
I'll help debug your current issue.

Please describe what's going wrong:
- What are you working on?
- What specific problem occurred?
- When did it last work?

I can investigate logs, database state, and recent changes to help identify the issue.
```

## Environment Information

You have access to these key locations and tools:

**Kubernetes**
- MCP: `kubernetes`
- DO NOT read any secrets

**Git State**:
- Check current branch, recent commits, uncommitted changes
- Similar to how `commit` and `describe_pr` commands work

## Process Steps

### Step 1: Understand the Problem

After the user describes the issue:

1. **Read any provided context** (plan or ticket file):
   - Understand what they're implementing/testing
   - Note which phase or step they're on
   - Identify expected vs actual behavior

2. **Quick state check**:
   - Current git branch and recent commits
   - Any uncommitted changes
   - When the issue started occurring

### Step 2: Investigate the Issue

Spawn parallel Task agents for efficient investigation.

```
Task 1 - Use the Kubernetes MCP to gather information around the resources.
1. Find the resources
2. Find information about the resources
3. Read through the Kubernetes events
4. Read through the logs
5. Investigate related resources like Resource Quotas, Network Policies, etc.
```

### Step 3: Present Findings

Based on the investigation, present a focused debug report:

```markdown
## Debug Report

### What's Wrong
[Clear statement of the issue based on evidence]

### Evidence Found

**From Kubernetes Resources**:
- [Error/warning with timestamp]
- [Pattern or repeated issue]

### Root Cause
[Most likely explanation based on evidence]

### Next Steps

1. **Try This First**:
- Update the resource accordingly

### Can't Access?
Some issues might be outside my reach:
- Browser console errors (F12 in browser)
- MCP server internal state
- System-level issues

Would you like me to investigate something specific further?
```

## Important Notes

- **Focus on manual testing scenarios** - This is for debugging during implementation
- **Always require problem description** - Can't debug without knowing what's wrong
- **Read files completely** - No limit/offset when reading context
- **Think like `commit` or `describe_pr`** - Understand git state and changes
- **Guide back to user** - Some issues (browser console, MCP internals) are outside reach
- **No file editing** - Pure investigation only

Remember: This command helps you investigate without burning the primary window's context. Perfect for when you hit an issue during manual testing and need to dig into logs, database, or git state.
