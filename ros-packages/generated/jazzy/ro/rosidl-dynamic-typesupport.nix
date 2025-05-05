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
  version = "0.1.2-3";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcutils rosidl-runtime-c ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils rosidl-runtime-c ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_dynamic_typesupport" = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport-release.git";
        rev = "11e03873b5cc3303db45c9729a8c3fdc57d0d5b8";
        hash = "sha256-oKjjvQ8+9kmE/JYX1boHfRN4q52+Uk9mjH3KtVPWC1U=";
      };
    };
  });
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
})
