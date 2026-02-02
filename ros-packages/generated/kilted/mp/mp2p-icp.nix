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
  version = "2.4.1-1";
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
        rev = "f75eba69bd8cfd6a2a1c1496e82b53b4ab83f1cb";
        hash = "sha256-vqBQYJpApqkJxTJ1RvnD5/2h9o2Mi+KiTjSRV+7Mozw=";
      };
    };
  });
  meta = {
    description = "A repertory of multi primitive-to-primitive (MP2P) ICP algorithms in C++";
  };
})
