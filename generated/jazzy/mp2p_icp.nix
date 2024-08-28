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
        rev = "e50163c7bfee52686e8ff22ccac2c6742bec304e";
        hash = "sha256-itzODkC4FMCInRHLd53wsi3KiKi+7L0yfk3hGn8WgJg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mp2p_icp";
  version = "1.5.5-1";
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
