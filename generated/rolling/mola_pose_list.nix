{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_pose_list = substituteSource {
      src = fetchgit {
        name = "mola_pose_list-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "22ebd50a45d191e820802f1ff3ff5918e7c9cefb";
        hash = "sha256-zrnHQ68Ecw4G6uKrSlk7+NVovKg+Np5SPKU7Wrq0DAE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_pose_list";
  version = "1.1.0-1";
  src = sources.mola_pose_list;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ library for searchable pose lists";
  };
}
