{
  buildRosPackage,
  cmake,
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
  substituteSource,
  tbb,
}:
let
  sources = rec {
    mp2p_icp = substituteSource {
      src = fetchgit {
        name = "mp2p_icp-source";
        url = "https://github.com/ros2-gbp/mp2p_icp-release.git";
        rev = "a38282a611a64ad84bcadd98bfa949748fb7dd64";
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
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt_libbase mrpt_libgui mrpt_libmaps mrpt_libobs mrpt_libposes mrpt_libtclap tbb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A repertory of multi primitive-to-primitive (MP2P) ICP algorithms in C++";
  };
}
