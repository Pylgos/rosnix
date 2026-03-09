{
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  laser-filters,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbot_utils";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot_utils";
  propagatedNativeBuildInputs = [ laser-filters launch-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-ftdi" "python3-libgpiod" "python3-pyudev" "python3-requests" "python3-serial" "python3-sh" "stm32flash" "usbutils" ]; };
  propagatedBuildInputs = [ laser-filters launch-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" "python3-ftdi" "python3-libgpiod" "python3-pyudev" "python3-requests" "python3-serial" "python3-sh" "stm32flash" "usbutils" ]; };
  checkInputs = [ ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_utils" = substituteSource {
      src = fetchgit {
        name = "rosbot_utils-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "dfe556ffb4da82fe5b31b6d2e0bb6b30cdb1e462";
        hash = "sha256-Q76RutjukkMb7g5j491SgdvIWu0oGs71SN2H3Ta4yxM=";
      };
    };
  });
  meta = {
    description = "Utilities for ROSbot Series";
  };
})
