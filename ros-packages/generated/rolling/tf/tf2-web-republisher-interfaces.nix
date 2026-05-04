{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_web_republisher_interfaces";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."tf2_web_republisher_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_web_republisher_interfaces" = substituteSource {
      src = fetchgit {
        name = "tf2_web_republisher_interfaces-source";
        url = "https://github.com/ros2-gbp/tf2_web_republisher-release.git";
        rev = "d75b17810e00615878656f66765b8db7ad17c5e0";
        hash = "sha256-/ZOKjGvkOqe208vQ1qYwtCeuCgIszc8qVkKKi72vpC8=";
      };
    };
  });
  meta = {
    description = "Interface definitions for tf2_web_republisher";
  };
})
