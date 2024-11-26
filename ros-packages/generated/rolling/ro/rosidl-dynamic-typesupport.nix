{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_dynamic_typesupport";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils rosidl-runtime-c ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_dynamic_typesupport" = substituteSource {
        src = fetchgit {
          name = "rosidl_dynamic_typesupport-source";
          url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport-release.git";
          rev = "9ca962f4ede9e95baf52630264176bd79d294478";
          hash = "sha256-OXUHhjsC0xSHzFsM0du3PW9dmONfugFTdWk1Q+Kha9I=";
        };
      };
    });
  };
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
})
