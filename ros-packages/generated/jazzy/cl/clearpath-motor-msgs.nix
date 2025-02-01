{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_motor_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."clearpath_motor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_motor_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_motor_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "e0c0450eec195f346bc86e576c8049abd9715aff";
        hash = "sha256-jfQ12x2bZIA1wCf0DLf8k79XEiu7v/p98uEQKUFNy4w=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Motor Drivers.";
  };
})
