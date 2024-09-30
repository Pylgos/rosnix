{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-pose-list,
  mola-test-datasets,
  mp2p-icp,
  mrpt-libmaps,
  mrpt-libobs,
  mrpt-libslam,
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
  propagatedBuildInputs = [ mola-common mola-pose-list mp2p-icp mrpt-libmaps mrpt-libobs mrpt-libslam ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ mola-test-datasets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ library with algorithms for relocalization, global localization, or pose estimation given a large initial uncertainty";
  };
}
