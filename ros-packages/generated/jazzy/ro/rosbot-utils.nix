{
  ament-cmake,
  ament-cmake-python,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  laser-filters,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_utils";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_utils";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ generate-parameter-library laser-filters launch-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "alsa-utils" "python3-argcomplete" "python3-ftdi" "python3-libgpiod" "python3-pyudev" "python3-serial" "python3-sh" "stm32flash" "usbutils" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ generate-parameter-library laser-filters launch-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "alsa-utils" "python3-argcomplete" "python3-ftdi" "python3-libgpiod" "python3-pyudev" "python3-serial" "python3-sh" "stm32flash" "usbutils" ]; };
  checkInputs = [ ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_utils" = substituteSource {
      src = fetchgit {
        name = "rosbot_utils-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "8eb673bf55c9c4e26f0667acca51a2628fde816f";
        hash = "sha256-auq9+V6FZ0eosPANeNA6MO0VTBqycRNnZuWV2hf8PB4=";
      };
    };
  });
  meta = {
    description = "Utilities for ROSbot Series";
  };
})
