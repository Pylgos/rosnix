{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libposes,
  mrpt-libros-bridge,
  mrpt-libtclap,
  nav-msgs,
  ros-environment,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mvsim";
  version = "0.13.0-1";
  src = finalAttrs.passthru.sources."mvsim";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "unzip" "wget" ]; };
  propagatedBuildInputs = [ mrpt-libgui mrpt-libmaps mrpt-libposes mrpt-libros-bridge mrpt-libtclap nav-msgs ros2launch sensor-msgs stereo-msgs tf2 tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libzmq3-dev" "protobuf-dev" "pybind11-dev" "python3-pip" "python3-protobuf" "python3-venv" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mvsim" = substituteSource {
      src = fetchgit {
        name = "mvsim-source";
        url = "https://github.com/ros2-gbp/mvsim-release.git";
        rev = "cff1be6d3a6043285af1d208c775e98fc7ee45f0";
        hash = "sha256-ypubQ0l8jAjed+aq+SVdZqnkVu2AYb1I6/92PMIyspc=";
      };
    };
  });
  meta = {
    description = "A lightweight multivehicle simulation framework.";
  };
})
