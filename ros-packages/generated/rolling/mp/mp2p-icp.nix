{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-imu-preintegration,
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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."mp2p_icp";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-imu-preintegration mrpt-libbase mrpt-libgui mrpt-libmaps mrpt-libobs mrpt-libposes mrpt-libtclap ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "tbb" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-imu-preintegration mrpt-libbase mrpt-libgui mrpt-libmaps mrpt-libobs mrpt-libposes mrpt-libtclap ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mp2p_icp" = substituteSource {
      src = fetchgit {
        name = "mp2p_icp-source";
        url = "https://github.com/ros2-gbp/mp2p_icp-release.git";
        rev = "75b12e8328823fee7e1e6078019793a1703ad374";
        hash = "sha256-rg0ylq5UJeSmQ7f469V8+iVW2KvPPlfzz39t0r+atOE=";
      };
    };
  });
  meta = {
    description = "A repertory of multi primitive-to-primitive (MP2P) ICP algorithms in C++";
  };
})
