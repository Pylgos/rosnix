{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libbase,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libobs,
  mrpt-libposes,
  mrpt-libtclap,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mp2p_icp";
  version = "1.6.6-1";
  src = finalAttrs.passthru.sources."mp2p_icp";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ mola-common mrpt-libbase mrpt-libgui mrpt-libmaps mrpt-libobs mrpt-libposes mrpt-libtclap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mp2p_icp" = substituteSource {
      src = fetchgit {
        name = "mp2p_icp-source";
        url = "https://github.com/ros2-gbp/mp2p_icp-release.git";
        rev = "078be31c6ee3a1086c87006b851fd18957ab7a2c";
        hash = "sha256-qiYAKVZJtH6BBwLIdiFkrdS5guyBw0AFBGtaCSYSFFQ=";
      };
    };
  });
  meta = {
    description = "A repertory of multi primitive-to-primitive (MP2P) ICP algorithms in C++";
  };
})
