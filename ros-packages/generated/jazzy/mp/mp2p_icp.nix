{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola_common,
  mrpt_libbase,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libobs,
  mrpt_libposes,
  mrpt_libtclap,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mp2p_icp" = substituteSource {
      src = fetchgit {
        name = "mp2p_icp-source";
        url = "https://github.com/ros2-gbp/mp2p_icp-release.git";
        rev = "58fc2fca97687c581f8a84d31c5ac553880fd6b5";
        hash = "sha256-sxWa6Jzb8GW/7BfFmn8OXazQdq6fF+DkB5C7KyDJTtY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mp2p_icp";
  version = "1.6.2-1";
  src = sources."mp2p_icp";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mrpt_libbase mrpt_libgui mrpt_libmaps mrpt_libobs mrpt_libposes mrpt_libtclap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A repertory of multi primitive-to-primitive (MP2P) ICP algorithms in C++";
  };
}
