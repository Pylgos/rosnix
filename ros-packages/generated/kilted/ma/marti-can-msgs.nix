{
  ament-cmake,
  buildAmentCmakePackage,
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
  pname = "marti_can_msgs";
  version = "1.6.1-2";
  src = finalAttrs.passthru.sources."marti_can_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_can_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_can_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "16e69296f59622f16dbb9f18eae09e0d67dd57f9";
        hash = "sha256-UXkL8nLeSUw2UtfM+OmwG+nVy6UgHvo+FUNAnEyzdvA=";
      };
    };
  });
  meta = {
    description = "\n\n     marti_can_msgs\n\n  ";
  };
})
