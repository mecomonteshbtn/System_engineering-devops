#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/**
 * infinite_while - runs an infinite loop for testing
 *
 * Return: always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - entry point for program
 *
 * Return: always 0
 */
int main(void)
{
	int i = 0, pid = 0;

	for (; i < 5; i++)
	{
		pid = fork();
		if (pid < 0)
			continue;
		else if (pid == 0)
			exit(0);
		else
			printf("Zombie process created, PID: %d\n", pid);
	}
	infinite_while();
	return (0);
}
