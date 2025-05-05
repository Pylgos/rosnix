{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  marti-common-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_nav_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs marti-common-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs marti-common-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_nav_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_nav_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "110d1184aeab85ae7572797b86bed47423ca1341";
        hash = "sha256-WC74STLyXxQWjttsVnjyGJBkUwtFtgJmR+gAEla3CT0=";
      };
    };
  });
  meta = {
    description = "\n\n     marti_nav_msgs\n\n  ";
  };
})
