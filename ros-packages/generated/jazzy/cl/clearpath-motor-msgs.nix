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
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."clearpath_motor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_motor_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_motor_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "79622955e0b7465403f0ee469a427f94171eb02f";
        hash = "sha256-WDsNGSJ6bGZd0n5XcsHgWbP+AG0JpY7AkCbG2jI1+Aw=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Motor Drivers.";
  };
})
