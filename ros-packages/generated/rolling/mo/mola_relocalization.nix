{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola_common,
  mola_pose_list,
  mola_test_datasets,
  mp2p_icp,
  mrpt_libmaps,
  mrpt_libobs,
  mrpt_libslam,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mola_relocalization" = substituteSource {
      src = fetchgit {
        name = "mola_relocalization-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "e5e9d4fce20ea65f5edd3f6d52d5e79e233389b1";
        hash = "sha256-xXFtgqQRz4RRcwaWzI0psVvvIlKDid5pKueu2z6lXoo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mola_relocalization";
  version = "1.2.0-1";
  src = sources."mola_relocalization";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mola_pose_list mp2p_icp mrpt_libmaps mrpt_libobs mrpt_libslam ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ mola_test_datasets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ library with algorithms for relocalization, global localization, or pose estimation given a large initial uncertainty";
  };
}
