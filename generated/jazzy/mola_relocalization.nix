{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_pose_list,
  mola_test_datasets,
  mp2p_icp,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_relocalization = substituteSource {
      src = fetchgit {
        name = "mola_relocalization-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "343ca4f6d4cc9b424a54dbaa79ef4df4ef926eb5";
        hash = "sha256-4erWF8hoe4EWIamH9rthP+ASM/tOP7x+hrxhj7udqK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_relocalization";
  version = "1.1.0-1";
  src = sources.mola_relocalization;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_pose_list mola_test_datasets mp2p_icp mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ library with algorithms for relocalization, global localization, or pose estimation given a large initial uncertainty";
  };
}
