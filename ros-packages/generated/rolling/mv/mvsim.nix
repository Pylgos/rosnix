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
  version = "0.14.0-1";
  src = finalAttrs.passthru.sources."mvsim";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint mrpt-libgui mrpt-libmaps mrpt-libposes mrpt-libtclap nav-msgs ros2launch ros-environment sensor-msgs stereo-msgs tf2 tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libzmq3-dev" "mrpt_libros_bridge" "protobuf-dev" "pybind11-dev" "python3-pip" "python3-protobuf" "python3-venv" "unzip" "wget" ]; };
  buildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint mrpt-libgui mrpt-libmaps mrpt-libposes mrpt-libtclap nav-msgs ros2launch ros-environment sensor-msgs stereo-msgs tf2 tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libzmq3-dev" "mrpt_libros_bridge" "protobuf-dev" "pybind11-dev" "python3-pip" "python3-protobuf" "python3-venv" "unzip" "wget" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mvsim" = substituteSource {
      src = fetchgit {
        name = "mvsim-source";
        url = "https://github.com/ros2-gbp/mvsim-release.git";
        rev = "2d6e3015b3399f2bb5563d56081877fa6f1f0bf2";
        hash = "sha256-hm8yWVuKPQk4V4q5GcASJL+sMKeHALpaLmpsGuPxgQE=";
      };
    };
  });
  meta = {
    description = "A lightweight multivehicle simulation framework.";
  };
})
