import os
import sys
import shutil

def gather_dtso(dtso_src_dir, work_dir, build_option_dir):
	dtbo_dir = os.path.join(work_dir, build_option_dir, "dtbo")
	if not os.path.exists(dtbo_dir):
            os.makedirs(dtbo_dir)

	dst_dir = os.path.join(dtbo_dir, "context-0")
	if not os.path.exists(dst_dir):
            os.makedirs(dst_dir)

	for root, dirs, files in os.walk(os.path.join(dtso_src_dir, build_option_dir)):
		for file in files:
			if file.endswith(".dtso"):
				dtso_file = os.path.join(root, file)
				dst_path = os.path.join(dst_dir, file)
				shutil.copy(dtso_file, dst_path)


if __name__ == '__main__':
    if len(sys.argv) < 4:
        print("Three arguments expected: dtso src, work and build option directory paths.")
        exit()
    argumentList = sys.argv[1:]
    dtso_src_dir = argumentList[0]
    work_dir = argumentList[1]

    if not os.path.exists(work_dir):
        os.makedirs(work_dir)

    build_option_dir = argumentList[2]

    if os.path.exists(dtso_src_dir):
        gather_dtso(dtso_src_dir, work_dir, build_option_dir)
    else:
        print("dtso_src_dir directory does not exist.")


