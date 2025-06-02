{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlesim_msgs";
  version = "1.10.1-1";
  src = finalAttrs.passthru.sources."turtlesim_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlesim_msgs-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "378f395070c4f664761f6ca1bb36bea6e0928559";
        hash = "sha256-UUkWnlZ/TZ69+L2lKMXGcaKtm3snD5wsKQR9uU2X7RE=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim messages.\n  ";
  };
})
