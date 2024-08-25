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
        rev = "af39369fb400b913872293ed3006529778829d5a";
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
