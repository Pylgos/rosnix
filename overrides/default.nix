{ lib, config }:

final: prev: {
  rosPackages = prev.rosPackages.overrideScope (
    rosFinal: rosPrev: {
      ament_cmake_vendor_package = rosPrev.ament_cmake_vendor_package.overrideAttrs (
        {
          patches ? [ ],
          propagatedBuildInputs ? [ ],
          ...
        }:
        {
          propagatedBuildInputs = propagatedBuildInputs ++ [ final.git ];
          patches = patches ++ [ ./ament_cmake_vendor_package.patch ];
        }
      );
      rosidl_generator_py = rosPrev.rosidl_generator_py.overrideAttrs (
        {
          depsTargetTargetPropagated ? [ ],
          ...
        }:
        {
          depsTargetTargetPropagated = depsTargetTargetPropagated ++ [ final.pkgsTargetTarget.python3 ];
        }
      );
      libcurl_vendor = rosPrev.libcurl_vendor.overrideAttrs (
        {
          propagatedBuildInputs ? [ ],
          ...
        }:
        {
          postInstall = ''
            ln -s $out/opt/libcurl_vendor/lib64 $out/opt/libcurl_vendor/lib
          '';
          propagatedBuildInputs = propagatedBuildInputs ++ [ final.openssl ];
        }
      );
      python_qt_binding = rosPrev.python_qt_binding.overrideAttrs (
        {
          patches ? [ ],
          ...
        }:
        {
          patches = patches ++ [ ./python_qt_binding.patch ];
        }
      );
      cartographer = rosPrev.cartographer.overrideAttrs (
        {
          nativeBuildInputs ? [ ],
          propagatedBuildInputs ? [ ],
          ...
        }:
        {
          nativeBuildInputs = nativeBuildInputs ++ [ final.pkg-config ];
          propagatedBuildInputs =
            (lib.remove final.abseil-cpp (lib.remove final.protobuf propagatedBuildInputs))
            ++ [
              final.abseil-cpp_202206
              final.protobuf_21
            ];
        }
      );
    }
  );
}
