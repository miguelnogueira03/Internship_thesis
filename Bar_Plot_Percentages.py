import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os


# Load the data from the provided text file
def load_data(file_path):
    df = pd.read_csv(file_path, delimiter='\t', header=None)
    df.columns = ['Title'] + ['Khoisan %', 'Eastern Africa %', 'Bantu %']
    df['Group'] = df['Title'].ne(df['Title'].shift())  # Mark the first occurrence of each group
    return df


# Plot stacked bar chart (admixture-style) and save as PNG
def plot_admixture_bars(df, output_file):
    plt.figure(figsize=(14, 7))

    indices = np.arange(len(df))
    bottom = np.zeros(len(df))

    for col in ['Khoisan %', 'Eastern Africa %', 'Bantu %']:
        plt.bar(indices, df[col], bottom=bottom, label=col)
        bottom += df[col]

    # Adjusting title placement to prevent overlapping
    group_positions = df.index[df['Group']].tolist()
    group_labels = df.loc[df['Group'], 'Title'].tolist()
    plt.xticks(group_positions, group_labels, rotation=45, ha='right')
    plt.xlabel('Groups')
    plt.ylabel('Proportion')
    plt.legend()
    plt.title('Admixture-style Stacked Bar Plot')
    plt.grid(axis='x', linestyle='--', alpha=0.5)

    # Separate groups with vertical lines
    for pos in group_positions:
        plt.axvline(x=pos - 0.5, color='black', linestyle='--', linewidth=0.5)

    plt.savefig(output_file, bbox_inches='tight')
    plt.close()


# File path
file_path = '/Users/miguelnogueira/documents/Jorge_Calculus.txt'
output_file = '/Users/miguelnogueira/documents/Jorge_Calculus.png'

df = load_data(file_path)
plot_admixture_bars(df, output_file)


