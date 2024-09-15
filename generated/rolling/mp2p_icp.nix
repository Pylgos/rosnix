{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libbase,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libobs,
  mrpt_libposes,
  mrpt_libtclap,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mp2p_icp = substituteSource {
      src = fetchgit {
        name = "mp2p_icp-source";
        url = "https://github.com/ros2-gbp/mp2p_icp-release.git";
        rev = "34ae78753dd66d2a5d42248862bc5333932f34fd";
        hash = "sha256-GO2Xt5WxC/CRlFiqr4LpsuFNToaYLJXWnUPU3I8upmY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mp2p_icp";
  version = "1.6.0-1";
  src = sources.mp2p_icp;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mrpt_libbase mrpt_libgui mrpt_libmaps mrpt_libobs mrpt_libposes mrpt_libtclap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A repertory of multi primitive-to-primitive (MP2P) ICP algorithms in C++";
  };
}
