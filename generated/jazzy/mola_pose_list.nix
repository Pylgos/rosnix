{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libmaps,
  mrpt_libposes,
  substituteSource,
}:
let
  sources = rec {
    mola_pose_list = substituteSource {
      src = fetchgit {
        name = "mola_pose_list-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "fdde177acd7be81b9e053cef2f2f24d669127e1b";
        hash = "sha256-MDp81JMxv9YwXZ9ivqVXrspeaTBhKxcxMqGnfb5+NnU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_pose_list";
  version = "1.1.3-1";
  src = sources.mola_pose_list;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt_libmaps mrpt_libposes ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ library for searchable pose lists";
  };
}
